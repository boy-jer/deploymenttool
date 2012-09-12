require 'spec_helper'

describe CampaignsController do

  it { should respond_to :new }
  it { should respond_to :create }
  it { should respond_to :show }
  it { should respond_to :destroy }
  it { should respond_to :counts }
  it { should respond_to :proof }
  it { should respond_to :final }
  it { should respond_to :scheduled }
  it { should respond_to :detials }
  it { should respond_to :duplicate }

end
