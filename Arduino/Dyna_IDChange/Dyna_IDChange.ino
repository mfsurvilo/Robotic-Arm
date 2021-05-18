
#include <DynamixelWorkbench.h>

DynamixelWorkbench dxl_wb;

void setup() 
{
  uint8_t currentID = 1;
  uint8_t newID = 2;


  dxl_wb.init("1", 1000000);
  uint16_t model_number = 0;

  dxl_wb.ping(currentID, &model_number);
  
  dxl_wb.itemWrite(currentID, "ID", newID);
}
