import { Controller, Get, Redirect } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Redirect('/index.html')
  index() {  }

  @Get('/send')
  @Redirect('/sender.html')
  send() {  }

  @Get('/receive')
  @Redirect('/receiver.html')
  receive() {  }

}
