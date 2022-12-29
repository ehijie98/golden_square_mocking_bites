class SecretDiary
    def initialize(diary) # diary is an instance of Diary
      # ...
      @diary = diary
      @diary_locked = true
    end
  
    def read
      # Raises the error "Go away!" if the diary is locked
      # Returns the diary's contents if the diary is unlocked
      # The diary starts off locked
      fail "Go away!" if @diary_locked
      return @diary.read
    end
  
    def lock
      # Locks the diary
      # Returns nothing
      @diary_locked = true
    end
  
    def unlock
      # Unlocks the diary
      # Returns nothing
      @diary_locked = false
    end
  end