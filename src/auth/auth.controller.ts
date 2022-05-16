import { Controller, Request, Post, UseGuards, Get } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { JwtAuthGuard } from './JwtAuth/jwt-auth.guard';
import { LocalAuthGuard } from './LocalAuth/local-auth.guard';


@Controller('auth')
export class AuthController {
    constructor(
        private authService: AuthService
    ) { }

    @UseGuards(LocalAuthGuard)
    @Post('login')
    async login(@Request() req) {
        return this.authService.login(req.user)
        
    }

}
