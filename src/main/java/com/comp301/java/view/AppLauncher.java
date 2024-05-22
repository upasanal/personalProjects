package com.comp301.java.view;

import com.comp301.java.SamplePuzzles;
import com.comp301.java.controller.ClassicMvcController;
import com.comp301.java.controller.ControllerImpl;
import com.comp301.java.model.*;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class AppLauncher extends Application {
  @Override
  public void start(Stage stage) {
    // TODO: Create your Model, View, and Controller instances and launch your GUI
    PuzzleLibrary puzzleLibraryObj = new PuzzleLibraryImpl();
    Puzzle pOne = new PuzzleImpl(SamplePuzzles.PUZZLE_01);
    Puzzle pTwo = new PuzzleImpl(SamplePuzzles.PUZZLE_02);
    Puzzle pThree = new PuzzleImpl(SamplePuzzles.PUZZLE_03);
    Puzzle pFour = new PuzzleImpl(SamplePuzzles.PUZZLE_04);
    Puzzle pFive = new PuzzleImpl(SamplePuzzles.PUZZLE_05);

    puzzleLibraryObj.addPuzzle(pOne);
    puzzleLibraryObj.addPuzzle(pTwo);
    puzzleLibraryObj.addPuzzle(pThree);
    puzzleLibraryObj.addPuzzle(pFour);
    puzzleLibraryObj.addPuzzle(pFive);

    Model bruhModel = new ModelImpl(puzzleLibraryObj);
    ClassicMvcController controlla = new ControllerImpl(bruhModel);
    View view = new View(bruhModel, controlla);
    Scene scene = new Scene(view.render(), 500, 500);
    scene.setFill(Color.DARKORANGE);
    scene.getStylesheets().add("main.css");
    stage.setScene(scene);

    bruhModel.addObserver(
        (Model m) -> {
          scene.setRoot(view.render());
          stage.sizeToScene();
        });

    stage.setTitle("Akari 4 The Baefies");
    stage.show();
  }
}
