import axios from 'axios'
import VueCommand from 'vue-command'
import 'vue-command/dist/vue-command.css'

export default {
  name: 'OpenodeTerminal',
  
  props: {
    instance: Object
  },

  data: () => ({
    current_path: '~',
    commands: {
      ls: ({ _ }) => {
        return new Promise(resolve => {
          axios.get('/admin/commands/ls', {params: {instance: document.querySelector('#openode-terminal-console').getAttribute('data-instance-id'), command: `"${_.join(' ')}"`}})
          .then(response => {            
            resolve(response.data.msg)
          })          
          .catch(err => {
            resolve(err.response.data);
          })
        })
      },

      cd: ({ path, _ }) => {
        return new Promise(resolve => {
          axios.get('/admin/commands/cd', {params: {instance: document.querySelector('#openode-terminal-console').getAttribute('data-instance-id'), command: `"${_.join(' ')}"`}})
          .then(response => {            
            resolve(response.data.msg);
          }) 
          .catch(err => {
            resolve(err.response.data);
          })                   
        })        
      },
      
      df: ({ _ }) => {
        return new Promise(resolve => {
          axios.get('/admin/commands/df', {params: {instance: document.querySelector('#openode-terminal-console').getAttribute('data-instance-id'), command: `"${_.join(' ')}"`}})
          .then(response => {
            resolve(response.data.msg);
          })
          .catch(err => {
            resolve(err.response.data);
          })                   
        })        
      }     
    }
  }),  

  render() {
    return (
      <VueCommand commands={this.commands} prompt={`me@${this.instance.id}:#`} title={`me@${this.instance.id} ${this.current_path}`}/>
    )
  }
}