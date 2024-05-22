package com.comp301.java.controller;

import java.util.Random;

import com.comp301.java.model.CellType;
import com.comp301.java.model.Model;

public class ControllerImpl implements ClassicMvcController {

  private final Model modelBae;

  public ControllerImpl(Model model) {
    if (model == null) {
      throw new IllegalArgumentException("Wrong");
    }
    this.modelBae = model;
  }

  @Override
  public void clickNextPuzzle() {
    if (modelBae.getActivePuzzleIndex() != modelBae.getPuzzleLibrarySize() - 1) {
      modelBae.setActivePuzzleIndex(modelBae.getActivePuzzleIndex() + 1);
    }
  }

  @Override
  public void clickPrevPuzzle() {
    if (modelBae.getActivePuzzleIndex() != 0) {
      modelBae.setActivePuzzleIndex(modelBae.getActivePuzzleIndex() - 1);
    }
  }

  @Override
  public void clickRandPuzzle() {
    int wholeSize = modelBae.getPuzzleLibrarySize();
    Random randy = new Random();
    int randomBoi = randy.nextInt(wholeSize);

    while (randomBoi == modelBae.getActivePuzzleIndex()) {
      randomBoi = randy.nextInt(wholeSize);
    }

    modelBae.setActivePuzzleIndex(randomBoi);
  }

  @Override
  public void clickResetPuzzle() {
    modelBae.resetPuzzle();
  }

  @Override
  public void clickCell(int r, int c) {

    if (modelBae.getActivePuzzle().getCellType(r, c) == CellType.CORRIDOR) {
      if (modelBae.isLamp(r, c)) {
        modelBae.removeLamp(r, c);
      } else if (!modelBae.isLamp(r, c)) {
        modelBae.addLamp(r, c);
      }
    }
  }
}
