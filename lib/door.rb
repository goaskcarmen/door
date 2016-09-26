# September 19th 2016
# door.rb
# This program define the property of a door object.

require_relative '../module_door'

class InscriptionError < StandardError
end

class OpenCloseError < StandardError
end

class LockError < StandardError
end

class Door::Door
  attr_reader :isopened, :islocked, :inscription, :has_inscription

# initially the door is closed and unlocked
  def initialize(isopened=false)
    @isopened = isopened
    @islocked = false
    @has_inscription = false
    @inscription = ""
  end

  def set_inscription(text)
    if text.class != String
      raise ArgumentError
    end

    if !has_inscription
      @inscription = text
      @has_inscription = true
    else
      raise InscriptionError
    end
  end

  def open_door
    if !isopened && !islocked
      @isopened = true
    else
      raise OpenCloseError
    end
  end

  def close
    if isopened
      @isopened = false
    else
      raise OpenCloseError
    end
  end

  def lock
    if !islocked && !isopened
      @islocked = true
    else
      raise LockError
    end
  end

  def unlock
    if islocked
      @islocked = false
    else
      raise LockError
    end
  end
end
