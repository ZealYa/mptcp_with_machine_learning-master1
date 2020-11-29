################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/dsdv/examples/dsdv-manet.cc 

CC_DEPS += \
./forbackup/src/dsdv/examples/dsdv-manet.d 

OBJS += \
./forbackup/src/dsdv/examples/dsdv-manet.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/dsdv/examples/%.o: ../forbackup/src/dsdv/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


