################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/point-to-point-layout/model/point-to-point-dumbbell.cc \
../forbackup/src/point-to-point-layout/model/point-to-point-grid.cc \
../forbackup/src/point-to-point-layout/model/point-to-point-star.cc 

CC_DEPS += \
./forbackup/src/point-to-point-layout/model/point-to-point-dumbbell.d \
./forbackup/src/point-to-point-layout/model/point-to-point-grid.d \
./forbackup/src/point-to-point-layout/model/point-to-point-star.d 

OBJS += \
./forbackup/src/point-to-point-layout/model/point-to-point-dumbbell.o \
./forbackup/src/point-to-point-layout/model/point-to-point-grid.o \
./forbackup/src/point-to-point-layout/model/point-to-point-star.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/point-to-point-layout/model/%.o: ../forbackup/src/point-to-point-layout/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


