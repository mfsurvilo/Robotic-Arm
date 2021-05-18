#include <DynamixelWorkbench.h>

DynamixelWorkbench dxl_wb;

void setup() {
dxl_wb.init("1",1000000);

uint16_t model_number = 0;
dxl_wb.ping(2, &model_number)
}

void loop() {
} 
