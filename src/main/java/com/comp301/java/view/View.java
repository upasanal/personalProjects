package com.comp301.java.view;

import com.comp301.java.controller.ClassicMvcController;
import com.comp301.java.model.Model;

import javafx.scene.Parent;
import javafx.scene.layout.BorderPane;

public class View implements FXComponent {

  private final Model modelBae;
  private final ClassicMvcController controlla;

  public View(Model model, ClassicMvcController controller) {
    this.modelBae = model;
    this.controlla = controller;
  }

  @Override
  public Parent render() {
    BorderPane borderBaefy = new BorderPane();

    MessageView messagey = new MessageView(modelBae, controlla);
    borderBaefy.setTop(messagey.render());

    PuzzleView puz = new PuzzleView(modelBae, controlla);
    borderBaefy.setCenter(puz.render());

    ControlView controllla = new ControlView(modelBae, controlla);
    borderBaefy.setBottom(controllla.render());

    return borderBaefy;
  }
}
