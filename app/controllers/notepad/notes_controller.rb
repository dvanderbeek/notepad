module Notepad
  class NotesController < ::Admin::BaseController
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    # POST /notes
    def create
      @note = Note.new(note_params)
      @note.author = current_admin_user
      render @note.save ? :create : :new
    end

    # PATCH/PUT /notes/1
    def update
      if @note.update(note_params)
        redirect_to [main_app, :admin, @note.notable], notice: 'Note was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /notes/1
    def destroy
      if @note.author == current_admin_user && @note.destroy
        flash[:notice] = 'Note was successfully destroyed.'
      else
        flash[:alert] = 'You can only delete your own notes.'
      end
      redirect_to [main_app, :admin, @note.notable]
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_note
        @note = Note.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def note_params
        params.require(:note).permit(:body, :notable_id, :notable_type)
      end
  end
end
