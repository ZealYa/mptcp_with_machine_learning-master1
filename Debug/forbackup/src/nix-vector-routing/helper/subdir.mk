################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/nix-vector-routing/helper/ipv4-nix-vector-helper.cc 

CC_DEPS += \
./forbackup/src/nix-vector-routing/helper/ipv4-nix-vector-helper.d 

OBJS += \
./forbackup/src/nix-vector-routing/helper/ipv4-nix-vector-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/nix-vector-routing/helper/%.o: ../forbackup/src/nix-vector-routing/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


