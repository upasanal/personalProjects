package com.comp301.java.model;

import java.util.ArrayList;
import java.util.List;

public class ModelImpl implements Model {
  private PuzzleLibrary librabae = new PuzzleLibraryImpl();
  private int activeOrNahI;
  private final List<ModelObserver> observersBae = new ArrayList<>();

  private Puzzle currentPuz;
  private boolean[][] boardHelper;

  public ModelImpl(PuzzleLibrary library) {
    this.librabae = library;
    this.activeOrNahI = 0;
    this.boardHelper =
        new boolean[library.getPuzzle(activeOrNahI).getHeight()]
            [library.getPuzzle(activeOrNahI).getWidth()];
    this.currentPuz = librabae.getPuzzle(activeOrNahI);
  }

  @Override
  public void addLamp(int r, int c) {
    if (currentPuz.getHeight() < r || currentPuz.getWidth() < c) {
      throw new IndexOutOfBoundsException();
    }
    if (currentPuz.getCellType(r, c) != CellType.CORRIDOR) {
      throw new IllegalArgumentException();
    }
    boardHelper[r][c] = true;
    notifyObservers();
  }

  @Override
  public void removeLamp(int r, int c) {
    if (currentPuz.getHeight() < r || currentPuz.getWidth() < c) {
      throw new IndexOutOfBoundsException();
    }
    if (currentPuz.getCellType(r, c) != CellType.CORRIDOR) {
      throw new IllegalArgumentException();
    }
    boardHelper[r][c] = false;
    notifyObservers();
  }

  @Override
  public boolean isLit(int r, int c) {
    if (currentPuz.getHeight() < r || currentPuz.getWidth() < c) {
      throw new IndexOutOfBoundsException();
    }
    if (currentPuz.getCellType(r, c) != CellType.CORRIDOR) {
      throw new IllegalArgumentException();
    }
    return (isLitTryingBruh(r, c) || isLamp(r, c));
  }

  private boolean isLitTryingBruh(int r, int c) {
    int x = r;
    int y = c;
    while ((x <= currentPuz.getHeight() - 1)
        && (currentPuz.getCellType(x, y) == CellType.CORRIDOR)) // getHeight -1?
    {
      if (x == r) {
        x = x + 1;
        continue;
      }
      if (isLamp(x, y)) {
        return true;
      }
      x = x + 1;
    }

    x = r;
    y = c;
    while ((y <= currentPuz.getWidth() - 1)
        && (currentPuz.getCellType(x, y) == CellType.CORRIDOR)) // getWidth -1;
    {
      if (y == c) {
        y = y + 1;
        continue;
      }
      if (isLamp(x, y)) {
        return true;
      }
      y = y + 1;
    }

    x = r;
    y = c;
    while ((x >= 0) && (currentPuz.getCellType(x, y) == CellType.CORRIDOR)) {
      if (x == r) {
        x = x - 1;
        continue;
      }
      if (isLamp(x, y)) {
        return true;
      }
      x = x - 1;
    }

    x = r;
    y = c;
    while ((y >= 0) && (currentPuz.getCellType(x, y) == CellType.CORRIDOR)) {
      if (y == c) {
        y = y - 1;
        continue;
      }
      if (isLamp(x, y)) {
        return true;
      }
      y = y - 1;
    }

    return false;
  }

  @Override
  public boolean isLamp(int r, int c) {
    if (currentPuz.getHeight() < r || currentPuz.getWidth() < c) {
      throw new IndexOutOfBoundsException();
    }
    if (currentPuz.getCellType(r, c) != CellType.CORRIDOR) {
      throw new IllegalArgumentException();
    }
    return boardHelper[r][c];
  }

  @Override
  public boolean isLampIllegal(int r, int c) {
    if (!isLamp(r, c)) {
      throw new IllegalArgumentException();
    }
    return isLitTryingBruh(r, c);
  }

  @Override
  public Puzzle getActivePuzzle() {
    return currentPuz;
  }

  @Override
  public int getActivePuzzleIndex() {
    return activeOrNahI;
  }

  @Override
  public void setActivePuzzleIndex(int index) {
    this.activeOrNahI = index;
    currentPuz = librabae.getPuzzle(activeOrNahI);
    boardHelper = new boolean[currentPuz.getHeight()][currentPuz.getWidth()];
    notifyObservers();
  }

  @Override
  public int getPuzzleLibrarySize() {
    return librabae.size();
  }

  @Override
  public void resetPuzzle() {
    boardHelper = new boolean[currentPuz.getHeight()][currentPuz.getWidth()];
    notifyObservers();
  }

  @Override
  public boolean isSolved() {
    int solveBae = 0;
    for (int i = 0; i < currentPuz.getHeight(); i++) {
      for (int j = 0; j < currentPuz.getWidth(); j++) {
        if (currentPuz.getCellType(i, j) == CellType.CLUE) {
          if (!isClueSatisfied(i, j)) {
            solveBae += 1;
          }
        } else if (currentPuz.getCellType(i, j) == CellType.CORRIDOR) {
          if (isLamp(i, j)) {
            if (isLampIllegal(i, j)) {
              solveBae += 1;
            }
          }
          if (!isLit(i, j)) {
            solveBae += 1;
          }
        }
      }
    }
    return solveBae == 0;
  }

  @Override
  public boolean isClueSatisfied(int r, int c) {
    if (r > currentPuz.getHeight() || c > currentPuz.getWidth()) {
      throw new IndexOutOfBoundsException();
    }
    if (currentPuz.getCellType(r, c) != CellType.CLUE) {
      throw new IllegalArgumentException();
    }
    int sumUpBae = 0;
    int countBaeSupposed = currentPuz.getClue(r, c);
    try {
      if (isLamp(r + 1, c)) {
        sumUpBae++;
      }
    } catch (IndexOutOfBoundsException | IllegalArgumentException e) {
    }
    try {
      if (isLamp(r - 1, c)) {
        sumUpBae++;
      }
    } catch (IndexOutOfBoundsException | IllegalArgumentException e) {
    }
    try {
      if (isLamp(r, c + 1)) {
        sumUpBae++;
      }
    } catch (IndexOutOfBoundsException | IllegalArgumentException e) {
    }
    try {
      if (isLamp(r, c - 1)) {
        sumUpBae++;
      }
    } catch (IndexOutOfBoundsException | IllegalArgumentException e) {
    }

    return countBaeSupposed == sumUpBae;
  }

  @Override
  public void addObserver(ModelObserver observer) {
    observersBae.add(observer);
  }

  @Override
  public void removeObserver(ModelObserver observer) {
    observersBae.remove(observer);
  }

  private void notifyObservers() {
    for (ModelObserver observer : observersBae) {
      observer.update(this);
    }
  }
}
