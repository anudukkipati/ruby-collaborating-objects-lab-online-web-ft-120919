require "pry"
class Artist
    attr_accessor :name 
    @@all = [] 

    def initialize(name)  
        @name = name    
        @@all << self 
        @songs = []
    end

    def self.all 
        @@all
    end

    def add_song(song)  
        Song.all.select{|song|@songs << song}
        song.artist = self
    end

    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)  
        
        self.all.find {|artist|artist.name == name} || self.new(name)     
    end

    def print_songs 
       Song.all.select do |song| 
          if song.artist == self
             puts song.name
          end
        end
    end
end