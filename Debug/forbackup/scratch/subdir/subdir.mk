################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/scratch/subdir/scratch-simulator-subdir.cc 

CC_DEPS += \
./forbackup/scratch/subdir/scratch-simulator-subdir.d 

OBJS += \
./forbackup/scratch/subdir/scratch-simulator-subdir.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/scratch/subdir/%.o: ../forbackup/scratch/subdir/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


