import axios from 'axios'

export default {
  name: 'NotificationItem',

  props: {
    notification: Object
  },

  methods: {
    markRead () {
      this.updating = true
      this.visibility = 'd-sm-none'
      this.$emit('updateNotifications',this.notification.id)

      axios.post(`/admin/notifications/${this.notification.id}/mark_read.json`)
        .then(response => {
          this.status = response.data.status
          this.updating = false          
        })
        .catch(err => {          
          this.$emit('displayError', { error: err })          
        })      
    },
    
    displayError (error) {
      this.$emit('onDisplayAlert',{error:error})
    }
  },

  data () {
    return {
      status: this.notification.status,
      updating: false,
      visibility: 'd-block'
    }
  },

  render () {
    return (
      <a class={`dropdown-item d-flex align-items-center ${this.visibility}`} href="#" on-click:stop={this.markRead}>
        <div class="mr-3">
          <div class={`icon-circle bg-${this.notification.level}`}>
            <i class={`fas fa-${this.notification.icon} text-white`}></i>
          </div>
        </div>
        <div>
          <div class="small text-gray-500">{this.notification.date}</div>
          <span class={`font-weight-${(this.notification.status == 'read' ? 'bold' : 'light')}`}>
            {this.notification.body}
          </span>
        </div>
      </a>      
    )
  }
}