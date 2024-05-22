package com.comp301.java.model;

public class PuzzleImpl implements Puzzle {
  private int[][] boardy;

  public PuzzleImpl(int[][] board) {
    this.boardy = board;
  }

  @Override
  public int getWidth() {
    return boardy[0].length;
  }

  @Override
  public int getHeight() {
    return boardy.length;
  }

  @Override
  public CellType getCellType(int r, int c) {
    if (r > boardy.length || c > boardy[1].length || r < 0 || c < 0) {
      throw new IndexOutOfBoundsException();
    }
    if (boardy[r][c] >= 0 && boardy[r][c] < 5) {
      return CellType.CLUE;
    }
    if (boardy[r][c] == 5) {
      return CellType.WALL;
    }
    return CellType.CORRIDOR;
  }

  @Override
  public int getClue(int r, int c) {
    if (r > boardy.length || c > boardy[1].length || r < 0 || c < 0) {
      throw new IndexOutOfBoundsException();
    }
    if (boardy[r][c] > 4) {
      throw new IllegalArgumentException();
    }
    return boardy[r][c];
  }
}
