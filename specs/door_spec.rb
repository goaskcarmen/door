# September 23rd 2016
# door_spec.rb
# Minitest for door.rb

require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Testing the door object' do

  let(:red_door) {Door::Door.new}
  let(:blue_door) {Door::Door.new}

  #open the blue door
  before do
    blue_door.open
  end

  it "test door inscription" do
    red_door.set_inscription("This is a red door")
    expect(red_door.has_inscription).must_equal(true)
    expect(red_door.inscription).must_equal("This is a red door")
  end

  it "door's inscription cannot be reset" do
    # skip
    red_door.set_inscription("This is another red door")
    expect(red_door.set_inscription("cannot be overwrite inscription")).must_raise RuntimeError
  end

  it "test that door inscription can only be a string." do
    # skip
    expect(red_door.set_inscription(23)).must_raise ArgumentError
  end

  it "test if door can be opened" do
    # skip
    red_door.open
    expect(red_door.isopened).must_equal(true)
    expect(red_door.isclosed).must_equal(false)
  end

  it "door cannot be opened if the door is already opened" do
    # skip
    expect(blue_door.isclosed).must_equal(false)
    expect(blue_door.open).must_raise(RuntimeError)
  end

  it "test to see if door is closed" do
    # skip
    expect(red_door.close).must_raise RuntimeError
    expect(red_door.isopened).must_equal(false)
  end

  it "test to see if an open door can be closed" do
    # skip
    blue_door.close
    expect(blue_door.isclosed).must_equal(true)
  end

  it "test to see if a door can be locked" do
    # skip
    red_door.lock
    expect(red_door.islocked).must_equal(true)
    expect(red_door.isunlocked).must_equal(false)
    expect(blue_door.lock).must_raise RuntimeError
  end

  it "test to see if a door can be unlocked" do
    # skip
    red_door.lock
    expect(red_door.islocked).must_equal(true)
    expect(red_door.isunlocked).must_equal(false)
  end

  it "A door cannot be unlocked if it is open" do
    # skip
    expect(blue_door.unlock).must_raise RuntimeError
  end

  it "A door cannot be lock if it is open" do
    # skip
    expect(blue_door.lock).must_raise RuntimeError
  end
end
