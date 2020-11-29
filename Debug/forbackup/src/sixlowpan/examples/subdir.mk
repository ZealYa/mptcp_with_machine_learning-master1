################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/sixlowpan/examples/example-ping-lr-wpan.cc \
../forbackup/src/sixlowpan/examples/example-sixlowpan.cc 

CC_DEPS += \
./forbackup/src/sixlowpan/examples/example-ping-lr-wpan.d \
./forbackup/src/sixlowpan/examples/example-sixlowpan.d 

OBJS += \
./forbackup/src/sixlowpan/examples/example-ping-lr-wpan.o \
./forbackup/src/sixlowpan/examples/example-sixlowpan.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/sixlowpan/examples/%.o: ../forbackup/src/sixlowpan/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


