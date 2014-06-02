require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'spreadsheet rows get created on save' do
    un = ENV['G_UN'] || 'jeffmiller00@gmail.com'
    pw = ENV['G_PW'] || 'TrueValue1'
    session = GoogleDrive.login(un, pw)

    ws = session.spreadsheet_by_title('Krista + Jeff').worksheet_by_title('Online RSVP')
    tot_rows = ws.num_rows

    Rsvp.create(
      :invited_guest_name => 'Automated Test',
      :plus_one           => true,
      :plus_one_name      => 'Automated Test Guest',
      :meal               => 'bits',
    )

    ws.reload
    assert ws.num_rows == tot_rows + 1

    (1..4).each do |i|
      ws[ws.num_rows, i] = nil
    end
    ws.save
  end
end
