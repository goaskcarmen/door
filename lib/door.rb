# September 19th 2016
# door.rb
# This program define the property of a door object.

require_relative '../module_door'

# class InscriptionError < StandardError
# end



class Door::Door
  attr_reader :isopened, :isclosed, :islocked, :isunlocked, :inscription, :has_inscription

# initially the door is closed and unlocked
  def initialize()
    @isopened = false
    @isclosed = !isopened
    @islocked = false
    @isunlocked = !islocked
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
      raise RuntimeError
    end
  end

  def open
    if isclosed && isunlocked
      @isopened = true
      @isclosed = !isopened
    else
      raise RuntimeError
    end
  end

  def close
    if isopened
      @isclosed = true
    else
      raise RuntimeError
    end
  end

  def lock
    if isunlocked && isclosed
      @islocked = true
      @isunlocked = false
    else
      raise RuntimeError
    end
  end

  def unlock
    if islocked
      @isunlocked = true
    else
      raise RuntimeError
    end
  end
end
