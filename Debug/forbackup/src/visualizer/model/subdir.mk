################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/visualizer/model/dummy-file-for-static-builds.cc \
../forbackup/src/visualizer/model/pyviz.cc \
../forbackup/src/visualizer/model/visual-simulator-impl.cc 

CC_DEPS += \
./forbackup/src/visualizer/model/dummy-file-for-static-builds.d \
./forbackup/src/visualizer/model/pyviz.d \
./forbackup/src/visualizer/model/visual-simulator-impl.d 

OBJS += \
./forbackup/src/visualizer/model/dummy-file-for-static-builds.o \
./forbackup/src/visualizer/model/pyviz.o \
./forbackup/src/visualizer/model/visual-simulator-impl.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/visualizer/model/%.o: ../forbackup/src/visualizer/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


