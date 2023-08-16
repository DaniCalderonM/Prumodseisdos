class AppliesController < ApplicationController
    before_action :authenticate_psuser!

    def psuser_apply
        @psuser = current_psuser
        @pspost = Pspost.find(params[:pspost_id])
        apply = Apply.find_by(psuser_id: @psuser.id, pspost_id: @pspost.id)
        if apply
        return flash.now[:alert] = 'Ya Postulaste a esta publicación'
        else
        @new_apply = Apply.new(psuser_id: @psuser.id, pspost_id: @pspost.id, kind: params[:kind])
        respond_to do |format|
        if @new_apply.save!
        format.html { redirect_to pspost_path(@pspost), notice: "#{current_psuser.name} ha dado a #{@new_apply.kind}
       en está publicación" }
        else
        format.html { redirect_to pspost_path(@pspost), status: :unprocessable_entity }
        end
            end
                end
    end
       
    def pspost_with_applies
        @applies = current_psuser.applies
        pspost_ids = @applies.map(&:pspost_id)
        @pspost = Pspost.where(id: pspost_ids)
       end

end
