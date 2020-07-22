module PlacesHelper

    private

    def user_owns_business(place)
      if place.owner_id == current_user.owner.id
        true
      else
        false
      end   
    end
end
