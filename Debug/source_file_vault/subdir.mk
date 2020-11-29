################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../source_file_vault/mptcp-test-auto-router.cc \
../source_file_vault/mptcp-test-simple-static-routing.cc 

CC_DEPS += \
./source_file_vault/mptcp-test-auto-router.d \
./source_file_vault/mptcp-test-simple-static-routing.d 

OBJS += \
./source_file_vault/mptcp-test-auto-router.o \
./source_file_vault/mptcp-test-simple-static-routing.o 


# Each subdirectory must supply rules for building sources it contributes
source_file_vault/%.o: ../source_file_vault/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


