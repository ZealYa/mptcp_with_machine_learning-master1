################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/uan/examples/uan-cw-example.cc \
../forbackup/src/uan/examples/uan-rc-example.cc 

CC_DEPS += \
./forbackup/src/uan/examples/uan-cw-example.d \
./forbackup/src/uan/examples/uan-rc-example.d 

OBJS += \
./forbackup/src/uan/examples/uan-cw-example.o \
./forbackup/src/uan/examples/uan-rc-example.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/uan/examples/%.o: ../forbackup/src/uan/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


