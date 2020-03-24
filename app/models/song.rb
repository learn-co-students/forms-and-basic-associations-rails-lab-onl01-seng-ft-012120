class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  #setter
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #getter
  def genre_name 
    self.genre ? self.genre.name : nil 
  end
    #setter
    def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
    end
  
    #getter
    def artist_name 
      self.artist ? self.artist.name : nil 
    end
  # #settter
  # def note_ids=(ids)
  #   ids.each do |id| 
  #     note = Note.find(id)
  #     self.notes << note 
  #   end
  # end

end
