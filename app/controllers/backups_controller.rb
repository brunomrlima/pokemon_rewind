class BackupsController < ApplicationController
  before_action :set_backup, only: :destroy
  
  def index
    @last_backup = Backup.last
  end

  def create
    Backup.perform_backup
    redirect_to backups_path, notice: "Backup Created"
  end

  def destroy
    @backup.destroy
    redirect_to backups_path, notice: "Backup Destroyed"
  end
  
  private
  
    def set_backup
      backup_id = params[:id]
      @backup = Backup.find_by(id: backup_id)
    end
end
