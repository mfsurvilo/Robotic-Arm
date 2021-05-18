#include <DynamixelWorkbench.h>

DynamixelWorkbench dxl_wb;

void setup() {
//uint8_t currentID = 1;
//uint8_t newID = 2
 
dxl_wb.init("1",1000000);
uint16_t model_number = 0;
dxl_wb.ping(2, &model_number)

dxl_wb.goalPosition(1, (int32_t)512);
delay(3000);

}

void loop() {
dxl_wb.goalPosition(1, (int32_t)0);
delay(3000);
dxl_wb.goalPosition(1, (int32_t)1023);
delay(3000);

} 
