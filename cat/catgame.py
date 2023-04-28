"""An interesting cat pet game."""
__author__ = "Upasana Lamsal"

from random import randint 
points: int = 0
player: str = ""
SAD_KITTY_EMOJI: str = "\U0001F63F"
HAPPY_KITTY_EMOJI: str = "\U0001F638"
BROKEN_HEART_EMOJI: str = "\U0001F494"
HEART_EMOJI: str = "\U0001F495"
cat_name: str = ""


def greet() -> None:
    """Entrance to the game that gives user instructions while asking for their name as the owner and what they want to name their kitty.""" 
    global player, cat_name
    owner: str = input("What is your name? ")
    player += owner
    print(f"Welcome, {player} \nThis is a new game called \"Sad Kitty\".\nMeet your sad kitty: {SAD_KITTY_EMOJI} \nYour goal in this game is to collect 100 happiness points or more to make your sad kitty{SAD_KITTY_EMOJI} a happy kitty{HAPPY_KITTY_EMOJI}. Make some good descisons along the way and you can make your kitty happy!")
    kitty_name: str = input("Name your cat: ")
    cat_name += kitty_name


def feed() -> None:
    """This operation feeds the cat to increase happiness and directly adds points to the global variable of points."""
    global points
    print(f"You have chosen Operation Food. Good choice {player}! \nYou will now choose from a series of options for food that will hopefully make kitty {cat_name} more happy!") 
    print("You get to choose between 3 options of food: \n 1. Temptations Chicken Flavored Cat Treat \n 2. Tuna Cat Food \n 3. Dog Food")
    food_option: int = int(input("Type your choice (either 1, 2, or 3): "))

    while food_option not in [1, 2, 3]:
        food_option = int(input("That is not an option. Type your choice again (either 1, 2, or 3): "))
    if food_option == 1:
        print(f"Great job {player}! You have earned 30 points. I think I see kitty {cat_name} looking a lot happier{HEART_EMOJI}!")
        points += 30
    elif food_option == 2: 
        print(f"Good job {player}! You have earned 20 points. I think kitty {cat_name} has more joy{HEART_EMOJI}!")
        points += 20
    elif food_option == 3:
        print(f"Oh no {player}! Kitty {cat_name} did not like the dog food. They disliked it so much that their happiness went down a random number of points in between 1 and 10{BROKEN_HEART_EMOJI}{BROKEN_HEART_EMOJI}. Hopefully kitty {cat_name} didn't loose too many happiness points!")
        points -= randint(1, 10)


def love_petting(pointy: int) -> int:
    """This operation makes the user choose where to pet the cats. This uses a local variable. The function returns an integer that is the updated points."""
    print(f"You have chosen Operation Petting. Good choice {player}! \nYou will now choose from a series of petting options that will hopefully make kitty {cat_name} more happy!") 
    print("Now, you get to choose between 3 options of petting: \n 1. Pet under their chin and around their ears \n 2. Pet their stomach and tail \n 3. Pet their neck and lower back")
    pet_option: int = int(input("Type your choice (either 1, 2, or 3): "))

    while pet_option not in [1, 2, 3]:
        pet_option = int(input("That is not an option. Type your choice again (either 1, 2, or 3): "))

    if pet_option == 1:
        print(f"Great job {player}! You have earned 30 points. Kitty {cat_name} is feeling so much more loved!{HEART_EMOJI}")
        pointy += 30
    elif pet_option == 3: 
        print(f"Good job {player}! You have earned 20 points. Kitty {cat_name} is feeling better and better!{HEART_EMOJI}")
        pointy += 20
    elif pet_option == 2:
        print(f"Oh no {player}! Kitty {cat_name} did not like being petted on their stomach and their tail{BROKEN_HEART_EMOJI}{BROKEN_HEART_EMOJI}. You have earned 0 points.")

    return pointy


def main() -> None:
    """This is the function where the game runs from. There is also game looping incorporated here so the user can choose whether to continue playing or not."""
    global points, emoji_of_emotion
    playing: bool = True
    greet()
    while playing:
        print(f"Choose between two operations to help make kitty {cat_name} more happy. The two choices are: \n1. Operation Food \n2. Operation Petting \nYou can also choose: \n3. End the Game ")
        operation_option: int = int(input("Type your choice (either 1, 2, 3): "))
        while operation_option not in [1, 2, 3]:
            operation_option = int(input("That is not an option. Type your choice again (either 1, 2, 3): "))
        if operation_option == 1:
            feed()
            print(f"You have collected {points} happiness points during the couse of the game so far. Do you wish to continue to make kitty {cat_name} more happy? Type 1 to continue and type 2 to end the game!")
            operation_optiony: int = int(input("Type your choice (either 1 or 2): "))
            while operation_optiony not in [1, 2]:
                operation_optiony = int(input("That is not an option. Type your choice again (either 1 or 2): "))
            if operation_optiony == 1:
                playing = True
            elif operation_optiony == 2: 
                playing = False
        elif operation_option == 2:
            points = love_petting(points)
            print(f"You have collected {points} happiness points during the couse of the game so far. Do you wish to continue to make kitty {cat_name} more happy? Type 1 to continue and type 2 to end the game!")
            operation_optiony = int(input("Type your choice (either 1 or 2): "))
            while operation_optiony not in [1, 2]:
                operation_optiony = int(input("That is not an option. Type your choice again (either 1 or 2): "))
            if operation_optiony == 1:
                playing = True
            elif operation_optiony == 2: 
                playing = False
        elif operation_option == 3:
            playing = False
    
    print(f"Thank you for playing the game! Kitty {cat_name} will miss you!{HEART_EMOJI}")
    if points >= 100:
        print(f"You have collected {points} happiness points during the couse of the game and are the owner of happy kitty {cat_name}{HAPPY_KITTY_EMOJI}. Bye for now, {player}!")
    elif points < 100: 
        print(f"You have collected {points} happiness points during the couse of the game. Bye for now, {player}!")


if __name__ == "__main__":
    main()
