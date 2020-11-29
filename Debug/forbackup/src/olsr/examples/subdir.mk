################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/olsr/examples/olsr-hna.cc \
../forbackup/src/olsr/examples/simple-point-to-point-olsr.cc 

CC_DEPS += \
./forbackup/src/olsr/examples/olsr-hna.d \
./forbackup/src/olsr/examples/simple-point-to-point-olsr.d 

OBJS += \
./forbackup/src/olsr/examples/olsr-hna.o \
./forbackup/src/olsr/examples/simple-point-to-point-olsr.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/olsr/examples/%.o: ../forbackup/src/olsr/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


