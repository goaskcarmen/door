# September 23rd 2016
# door_spec.rb
# Minitest for door.rb

require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Testing the door object' do

  let(:red_door) {Door::Door.new(false)} # red_door is initially close
  let(:blue_door) {Door::Door.new(true)} # blue_door is initially open

  it "test door inscription" do
    red_door.set_inscription("This is a red door")
    expect(red_door.has_inscription).must_equal(true)
    expect(red_door.inscription).must_equal("This is a red door")
  end

  it "door's inscription cannot be reset" do
    # skip
    red_door.set_inscription("This is another red door")
    proc {red_door.set_inscription("cannot be overwrite inscription")}.must_raise(InscriptionError)
  end

  it "test that door inscription can only be a string." do
    # skip
    proc {red_door.set_inscription(23)}.must_raise(ArgumentError)
  end

  it "test if red_door (close) can be opened" do
    # skip
    red_door.open_door
    expect(red_door.isopened).must_equal(true)
  end

  it "door cannot be opened if the door is already opened" do
    # skip
    expect(blue_door.isopened).must_equal(true)
    proc {blue_door.open_door}.must_raise(OpenCloseError)
  end

  it "test to see if red_door (close) cannot be closed again." do
    # skip
    proc {red_door.close}.must_raise(OpenCloseError)
    expect(red_door.isopened).must_equal(false)
  end

  it "test to see if blue_door (open) can be closed" do
    # skip
    blue_door.close
    expect(blue_door.isopened).must_equal(false)
  end

  it "test to see if red_door (close) can be locked" do
    # skip
    red_door.lock
    expect(red_door.islocked).must_equal(true)
  end

  it "test to see if blue_door (open) cannot be locked" do
    # skip
    proc {blue_door.lock}.must_raise(LockError)
  end

  it "test to see if red_door (close) can be lock and then unlocked" do
    # skip
    red_door.lock
    red_door.unlock
    expect(red_door.islocked).must_equal(false)
  end

  it "test to see if blue_door (open) cannot be unlocked" do
    # skip
    proc {blue_door.unlock}.must_raise(LockError)
  end
end
