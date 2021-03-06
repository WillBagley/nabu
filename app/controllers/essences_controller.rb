class EssencesController < ApplicationController
  load_and_authorize_resource :collection, :find_by => :identifier
  load_and_authorize_resource :item, :find_by => :identifier, :through => :collection
  load_and_authorize_resource :essence, :through => :item

  def show
    unless can? :manage, @essence
      if ['Open (subject to agreeing to PDSC access form)', 'Open (subject to the access condition details)'].include? @essence.item.access_condition.name
        unless session["terms_#{@collection.id}"] == true
          redirect_to show_terms_collection_item_essence_path
        end
      end
    end
  end

  def download
    Download.create! :user => current_user, :essence => @essence
    send_file @essence.path, :type => @essence.mimetype, :filename => @essence.filename
  end

  def display
    send_file @essence.path, :disposition => 'inline', :type => @essence.mimetype
  end

  def show_terms

  end

  def agree_to_terms
    if params[:agree] == '1'
      session["terms_#{@collection.id}"] = true
      redirect_to [@collection, @item, @essence]
    else
      flash[:error] = 'You must agree to the PDSC access form before you can view files'
      redirect_to [@collection, @item]
    end
  end

  def destroy
    output = %x{rm #{@essence.path} 2>&1}
    result = $?
    item = @essence.item
    @essence.destroy
    if result.success?
      flash[:notice] = "Essence removed successfully, also from archive (undo not possible)."
    else
      flash[:error] = "Essence removed, but file removing had error: #{output}"
    end
    redirect_to [item.collection, item]
  end
end
