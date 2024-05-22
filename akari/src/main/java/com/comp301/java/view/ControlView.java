package com.comp301.java.view;

import com.comp301.java.controller.ClassicMvcController;
import com.comp301.java.model.Model;

import javafx.event.ActionEvent;
import javafx.geometry.Pos;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;

public class ControlView implements FXComponent {
  private final Model modelBae;
  private final ClassicMvcController controlla;

  public ControlView(Model model, ClassicMvcController controller) {
    this.modelBae = model;
    this.controlla = controller;
  }

  @Override
  public Parent render() {
    HBox trying = new HBox();

    Button resetPuzz = new Button("Reset");
    resetPuzz.setOnAction((ActionEvent event) -> controlla.clickResetPuzzle());

    Button nextPuzzle = new Button("Next");
    nextPuzzle.setOnAction((ActionEvent event) -> controlla.clickNextPuzzle());

    Button prevPuzzle = new Button("Previous");
    prevPuzzle.setOnAction((ActionEvent event) -> controlla.clickPrevPuzzle());

    Button randoPuzzle = new Button("Rando");
    randoPuzzle.setOnAction((ActionEvent event) -> controlla.clickRandPuzzle());

    Button doneCheck = new Button("I'm Done!");
    doneCheck.setOnAction(
        (ActionEvent event) -> {
          if (modelBae.isSolved()) {
            doneCheck.setStyle("-fx-background-color: #7AAD22;");
            doneCheck.setText("Congratulations! You solved this Gurl!");
          } else {
            doneCheck.setStyle("-fx-background-color: #C82640;");
            doneCheck.setText("Oh no! You went wrong somewhere...");
          }
        });
    trying.getChildren().addAll(resetPuzz, randoPuzzle, prevPuzzle, nextPuzzle, doneCheck);
    trying.setAlignment(Pos.BASELINE_CENTER);
    return trying;
  }
}
