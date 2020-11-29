################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/nix-vector-routing/examples/nix-simple.cc \
../forbackup/src/nix-vector-routing/examples/nms-p2p-nix.cc 

CC_DEPS += \
./forbackup/src/nix-vector-routing/examples/nix-simple.d \
./forbackup/src/nix-vector-routing/examples/nms-p2p-nix.d 

OBJS += \
./forbackup/src/nix-vector-routing/examples/nix-simple.o \
./forbackup/src/nix-vector-routing/examples/nms-p2p-nix.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/nix-vector-routing/examples/%.o: ../forbackup/src/nix-vector-routing/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


