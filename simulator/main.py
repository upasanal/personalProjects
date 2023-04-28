"""This specially named module makes the package runnable."""

import constants
from model import Cell, Point
from controller import ViewController
from model import Model


def main() -> None:
    """Entrypoint of simulation."""
    model: Model = Model(constants.CELL_COUNT, constants.CELL_SPEED, constants.INFECTED_NUMBER, constants.IMMUNE_NUMBER)
    view_controller: ViewController = ViewController(model)
    view_controller.start_simulation()


if __name__ == "__main__":
    main()