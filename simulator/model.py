"""The model classes maintain the state and logic of the simulation."""

from __future__ import annotations
from random import random
import constants
from math import sin, cos, pi, sqrt


__author__ = "Upasana Lamsal"  


class Point:
    """A model of a 2-d cartesian coordinate Point."""
    x: float
    y: float

    def __init__(self, x: float, y: float):
        """Construct a point with x, y coordinates."""
        self.x = x
        self.y = y

    def add(self, other: Point) -> Point:
        """Add two Point objects together and return a new Point."""
        x: float = self.x + other.x
        y: float = self.y + other.y
        return Point(x, y)
        
    def distance(self, other: Point) -> float:
        """Calculates distance using formula."""
        answer: int = 0 
        component_one: int = (self.x - other.x) ** 2
        component_two: int = (self.y - other.y) ** 2
        answer = sqrt(component_one + component_two)
        return answer


class Cell:
    """An individual subject in the simulation."""
    location: Point
    direction: Point
    sickness: int = constants.VULNERABLE 

    def __init__(self, location: Point, direction: Point):
        """Construct a cell with its location and direction."""
        self.location = location
        self.direction = direction
    # Part 1) Define a method named `tick` with no parameters.
    # Its purpose is to reassign the object's location attribute
    # the result of adding the self object's location with its
    # direction. Hint: Look at the add method.

    def tick(self) -> None:
        """Calls upon add method from class Point to add the two points of location and the direction."""
        self.location = self.location.add(self.direction)
        if self.is_infected():
            self.sickness += 1
        if self.sickness > constants.RECOVERY_PERIOD:
            self.immunize()
    
    def contract_disease(self) -> None:
        """Assigns the sickness attribute to the value of 1, meaning infected."""
        self.sickness = constants.INFECTED

    def is_vulnerable(self) -> bool:
        """Returns true if sickness is vunerable and false otherwise."""
        if self.sickness == constants.VULNERABLE:
            return True 
        else:
            return False

    def is_infected(self) -> bool:
        """Returns true if sickness is infeceted and false otherwise."""
        if self.sickness >= constants.INFECTED:
            return True 
        else:
            return False

    def color(self) -> str:
        """Return the color representation of a cell."""
        if self.is_vulnerable():
            return "gray"
        elif self.is_infected():
            return "magenta"
        elif self.is_immune():
            return "orange"

    def contact_with(self, other: Cell) -> None:
        """Makes other point contract disease if it makes contact with one that is infected."""
        if self.is_infected() and other.is_vulnerable():
            other.contract_disease()
        if other.is_infected() and self.is_vulnerable():
            self.contract_disease()

    def immunize(self) -> None: 
        """Assigns the constant IMMUNE to the sickness attribute."""
        self.sickness = constants.IMMUNE

    def is_immune(self) -> bool:
        """Returns true if immune."""
        if self.sickness == constants.IMMUNE:
            return True 
        elif self.sickness != constants.IMMUNE:
            return False


class Model:
    """The state of the simulation."""

    population: list[Cell]
    time: int = 0

    def __init__(self, cells: int, speed: float, infect_numb: int, immune_cell: int = 0):
        """Initialize the cells with random locations and directions."""
        self.population = []
        if (infect_numb + immune_cell) >= cells or (infect_numb + immune_cell) <= 0: 
            raise ValueError("You cannot have the amount of immune or infected cells be more then the total number of cells or a negative amount.")

        for i in range(cells):
            start_location: Point = self.random_location()
            start_direction: Point = self.random_direction(speed)
            cellss: Cell = Cell(start_location, start_direction)
            if i in range(infect_numb): 
                cellss.contract_disease()
            if i in range(infect_numb, infect_numb + immune_cell, 1):
                cellss.immunize()
            self.population.append(cellss)
        
    def tick(self) -> None:
        """Update the state of the simulation by one time step."""
        self.time += 1
        for cell in self.population:
            cell.tick()
            self.enforce_bounds(cell)
        self.check_contacts()

    def random_location(self) -> Point:
        """Generate a random location."""
        start_x: float = random() * constants.BOUNDS_WIDTH - constants.MAX_X
        start_y: float = random() * constants.BOUNDS_HEIGHT - constants.MAX_Y
        return Point(start_x, start_y)

    def random_direction(self, speed: float) -> Point:
        """Generate a 'point' used as a directional vector."""
        random_angle: float = 2.0 * pi * random()
        direction_x: float = cos(random_angle) * speed
        direction_y: float = sin(random_angle) * speed
        return Point(direction_x, direction_y)

    def enforce_bounds(self, cell: Cell) -> None:
        """Cause a cell to 'bounce' if it goes out of bounds."""
        if cell.location.x > constants.MAX_X:
            cell.location.x = constants.MAX_X
            cell.direction.x *= -1.0 
        if cell.location.y > constants.MAX_Y:
            cell.location.y = constants.MAX_Y
            cell.direction.y *= -1.0 
        if cell.location.y < constants.MIN_Y:
            cell.location.y = constants.MIN_Y
            cell.direction.y *= -1.0 
        if cell.location.x < constants.MIN_X:
            cell.location.x = constants.MIN_X
            cell.direction.x *= -1.0 

    def is_complete(self) -> bool:
        """Method to indicate when the simulation is complete."""
        for cell in self.population: 
            if cell.is_infected():
                return False
        return True 

    def check_contacts(self) -> None: 
        """Method to compare distances."""
        i: int = 0 
        while i < len(self.population):
            item_1: Cell = self.population[i]
            j: int = 1 
            while j < len(self.population) and i != j:
                item_2: Cell = self.population[j]
                if item_1.location.distance(item_2.location) < constants.CELL_RADIUS:
                    item_1.contact_with(item_2)
                j += 1
            i += 1