################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/nix-vector-routing/model/ipv4-nix-vector-routing.cc 

CC_DEPS += \
./forbackup/src/nix-vector-routing/model/ipv4-nix-vector-routing.d 

OBJS += \
./forbackup/src/nix-vector-routing/model/ipv4-nix-vector-routing.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/nix-vector-routing/model/%.o: ../forbackup/src/nix-vector-routing/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


