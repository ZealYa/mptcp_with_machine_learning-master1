################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mesh/examples/mesh.cc 

CC_DEPS += \
./forbackup/src/mesh/examples/mesh.d 

OBJS += \
./forbackup/src/mesh/examples/mesh.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mesh/examples/%.o: ../forbackup/src/mesh/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


