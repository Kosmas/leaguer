require 'spec_helper'

describe SeasonsController do
  it 'displays an error for a missing season' do
    get :show, id: 'not-here'
    expect(response).to redirect_to(seasons_path)
    message = 'The season you were looking for could not be found.'
    expect(flash[:alert]).to eql(message)
  end
end
