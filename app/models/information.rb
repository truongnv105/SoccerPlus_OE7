class Information < ApplicationRecord
  belongs_to :match,  inverse_of: :informations

  after_save :send_detail_match

  private

  def send_detail_match
    @information = Information.last

    ActionCable.server.broadcast "informations",
      information: @information.detail
  end
end
