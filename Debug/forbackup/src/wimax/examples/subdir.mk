################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/wimax/examples/wimax-ipv4.cc \
../forbackup/src/wimax/examples/wimax-multicast.cc \
../forbackup/src/wimax/examples/wimax-simple.cc 

CC_DEPS += \
./forbackup/src/wimax/examples/wimax-ipv4.d \
./forbackup/src/wimax/examples/wimax-multicast.d \
./forbackup/src/wimax/examples/wimax-simple.d 

OBJS += \
./forbackup/src/wimax/examples/wimax-ipv4.o \
./forbackup/src/wimax/examples/wimax-multicast.o \
./forbackup/src/wimax/examples/wimax-simple.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/wimax/examples/%.o: ../forbackup/src/wimax/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


