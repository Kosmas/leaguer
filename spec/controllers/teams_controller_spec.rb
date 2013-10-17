require 'spec_helper'

describe TeamsController do
  it 'displays an error for a missing team' do
    get :show, id: 'not-here'
    expect(response).to redirect_to(teams_path)
    message = 'The team you were looking for could not be found.'
    expect(flash[:alert]).to eql(message)
  end
end
