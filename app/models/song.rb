class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many  :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_attributes=(notes)
    count = 0
    while count < notes.count
      note = Note.find_or_create_by(content: notes[count]["content"])
      self.notes << note
      count +=1
    end
  end

end
