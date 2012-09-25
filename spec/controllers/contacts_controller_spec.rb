require 'spec_helper'

describe ContactsController do

  it { should respond_to :search }
  it { should respond_to :create }
  it { should respond_to :new }
  it { should respond_to :destroy }

end
