Table tableHum, tableSolar, tableTemp, MineTable, tablePres, tableWS, tableWD;
IntList humIdList;
float[] sredniaSolar;
float sumaSolar;
float k, x, z;


void setup() {
 
  MineTable = new Table();
  MineTable.addColumn("id");
  MineTable.addColumn("srednia");
  
  sumaSolar = 0;
  k = 0;
  z = 30;
  tableWD = loadTable("wind direction in degrees.csv");
  tableSolar = loadTable("solar radiation.csv");
 
  for (int i = 0; i < 360; i++) {
    z = (float)i;
    println("z: " + z);
    for(int j = 0; j < (tableWD.getRowCount() - 1); j++) {
      if ((tableWD.getFloat(j, 4) > z - 0.5) && (tableWD.getFloat(j, 4) < z + 1.5)) {
        sumaSolar = sumaSolar + tableSolar.getFloat(tableWD.getInt(j, 0), 4);
        k++;
        println("add " + j);
      }
    }
    if(!(k == 0)) {
      println(sumaSolar);
      println(k);
      x = sumaSolar / k;
      println(x);
      TableRow newRow = MineTable.addRow();
      newRow.setFloat("id", z);
      newRow.setFloat("srednia", x);
      k = 0;
      sumaSolar = 0;
    } else
      k = 0;
      sumaSolar = 0;
  }
 saveTable(MineTable, "jakieWD.csv");
}

void draw() {
  
} 