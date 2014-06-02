class Rsvp < ActiveRecord::Base

  after_save :send_to_spreadsheet


  def plus_one?
    !!self.plus_one
  end

  def send_to_spreadsheet
    #system( "sh .env_secrets") if ENV['G_UN']
    un = ENV['G_UN'] || 'jeffmiller00@gmail.com'
    pw = ENV['G_PW'] || 'TrueValue1'
    session = GoogleDrive.login(un, pw)

    ws = session.spreadsheet_by_title('Krista + Jeff').worksheet_by_title('Online RSVP')

    new_row = ws.num_rows + 1
    invited_guest_col = 1
    plus_one_col      = 2
    plus_one_name_col = 3
    meal_col          = 4

    ws[new_row, invited_guest_col] = self.invited_guest_name
    ws[new_row, plus_one_col]      = self.plus_one?
    ws[new_row, plus_one_name_col] = self.plus_one_name
    ws[new_row, meal_col]          = self.meal
    ws.save
  end
end
