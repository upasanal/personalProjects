package com.comp301.java.view;

import com.comp301.java.controller.ClassicMvcController;
import com.comp301.java.model.CellType;
import com.comp301.java.model.Model;

import javafx.event.ActionEvent;
import javafx.geometry.Insets;
import javafx.scene.Parent;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.scene.control.Button;
import javafx.scene.text.Font;

public class PuzzleView implements FXComponent {
  private final Model modelBae;
  private final ClassicMvcController controlla;

  public PuzzleView(Model model, ClassicMvcController controller) {
    this.modelBae = model;
    this.controlla = controller;
  }

  @Override
  public Parent render() {
    GridPane mainBoard = new GridPane();
    mainBoard.setPadding(new Insets(10, 10, 10, 10));
    mainBoard.setHgap(10);
    mainBoard.setVgap(10);

    for (int row = 0; row < modelBae.getActivePuzzle().getHeight(); row++) {
      for (int col = 0; col < modelBae.getActivePuzzle().getWidth(); col++) {
        Button gridCell;
        gridCell = new Button();
        gridCell.setPrefSize(50, 50);
        if (modelBae.getActivePuzzle().getCellType(row, col) == CellType.CORRIDOR) {
          gridCell = new Button(" ");
          gridCell.setPrefSize(50, 50);
          mainBoard.add(gridCell, row, col);
          final int bruhRow = row;
          final int bruhCol = col;
          gridCell.setOnAction((ActionEvent event) -> controlla.clickCell(bruhRow, bruhCol));

          if (modelBae.isLamp(row, col)) {
            gridCell.setText("\ud83c\udf1e");
            gridCell.setPrefSize(50, 50);
          }
          if (modelBae.isLit(row, col)) {
            gridCell.setStyle("-fx-background-color: #e7e895;");
            gridCell.setPrefSize(50, 50);
          }
          if (modelBae.isLamp(row, col) && modelBae.isLampIllegal(row, col)) {
            gridCell.setStyle("-fx-background-color: #f2a7b9;");
            gridCell.setPrefSize(50, 50);
          }
        } else if (modelBae.getActivePuzzle().getCellType(row, col) == CellType.WALL) {
          gridCell = new javafx.scene.control.Button("   ");
          gridCell.setStyle("-fx-background-color: #10022b;");

          gridCell.setPrefSize(50, 50);

          mainBoard.add(gridCell, row, col);
        } else if (modelBae.getActivePuzzle().getCellType(row, col) == CellType.CLUE) {
          gridCell =
              new javafx.scene.control.Button(
                  String.valueOf(modelBae.getActivePuzzle().getClue(row, col)));
          gridCell.setStyle("-fx-background-color: #CBC3E3;");
          gridCell.setTextFill(Color.WHITE);

          gridCell.setPrefSize(50, 50);

          if (modelBae.isClueSatisfied(row, col)) {
            gridCell.setStyle("-fx-background-color: #29521b;");
          }

          mainBoard.add(gridCell, row, col);
        }
        gridCell = new Button();
      }
    }

    return mainBoard;
  }
}
