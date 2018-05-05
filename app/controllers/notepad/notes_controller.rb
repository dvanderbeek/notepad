module Notepad
  class NotesController < Notepad.base_controller.safe_constantize
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    # POST /notes
    def create
      @note = Note.new(note_params)
      @note.author = send(Notepad.author_method)
      render @note.save ? :create : :new
    end

    # PATCH/PUT /notes/1
    def update
      if @note.update(note_params)
        redirect_to redirect_path, notice: 'Note was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /notes/1
    def destroy
      if @note.author == send(Notepad.author_method) && @note.destroy
        flash[:notice] = 'Note was successfully destroyed.'
      else
        flash[:alert] = 'You can only delete your own notes.'
      end
      redirect_to redirect_path
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

      def redirect_path
        [main_app, Notepad.routing_namespace, @note.notable]
      end
  end
end
