# encoding: utf-8
require "rubygems"
require "rainbow"

class Formatter
  def self.story_id id
    id.to_s.color("#404040")
  end

  def self.state state
    if state == "finished"
      # state = state.color('009900').bright #background('009900').color('ffffff')
      " ✓ #{state} ".color('#b58900').underline
    elsif state == "accepted"
      " ✓ #{state} ".background('#859900').underline
    else
      state = state.bright # .background(:green).underline
    end
  end

  def self.requested_by requested_by
    requested_by.color("#268bd2")
  end

  def self.owner owner
    self.requested_by owner
  end

  def self.story_name story_name, opts={:heading => false}
    if opts[:heading] == true
      story_name.bright.underline
    else
      story_name
    end
  end

  def self.time_ago time
    (distance_of_time_in_words(Time.now, time) + " ago").color('#fdf6e3')
  end

  def self.note_author author
    self.requested_by(author)
  end

  def self.note_text text
    text.bright
  end

  def self.story_action comment, story_id, story_name
    story_name = Formatter.story_name(story_name, :heading => true)
    "#{comment} #{Formatter.story_id(story_id)}, #{story_name}"
  end

  def self.story_type type
    type.color '#99004C'
  end

  def self.attr_descriptor descriptor, attr
    "#{descriptor} → ".color('#333333') + attr
  end

  def self.description description
    description
  end
end
