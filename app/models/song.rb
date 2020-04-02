class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil
  end 

  def song_genre_id=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def song_genre_id
    self.genre.name if self.genre
  end
  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note) if !note.empty?
    end
  end

  def note_contents
    self.notes.map{|note| note.content }
  end

  # def note_contents=(content)
  #   content.each do |content|
  #     self.notes << Note.find_or_create_by(content: content)
  #   end
  # end

  # def note_contents
  #   ret = []
  #   self.notes.each do |note|
  #     ret << note.content unless note.content.empty?
  #   end
  #   ret
  # end 
  # add associations here
end
