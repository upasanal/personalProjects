package com.comp301.java.view;

import com.comp301.java.controller.ClassicMvcController;
import com.comp301.java.model.Model;

import javafx.scene.Parent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.control.Label;

public class MessageView implements FXComponent {
  private final Model modelBae;
  private final ClassicMvcController controlla;

  public MessageView(Model model, ClassicMvcController controller) {
    this.modelBae = model;
    this.controlla = controller;
  }

  @Override
  public Parent render() {
    StackPane helpMe = new StackPane();
    Label labelBruh = null;
    if (modelBae.isSolved()) {
      labelBruh =
          new Label(
              "Congratulations! You have solved puzzle "
                  + (modelBae.getActivePuzzleIndex() + 1)
                  + " out of "
                  + modelBae.getPuzzleLibrarySize());
    } else if (!modelBae.isSolved()) {
      labelBruh =
          new Label(
              "This is unsolved! Not quite right on puzzle "
                  + (modelBae.getActivePuzzleIndex() + 1)
                  + " out of "
                  + modelBae.getPuzzleLibrarySize());
    }
    helpMe.getChildren().add(labelBruh);
    return helpMe;
  }
}
